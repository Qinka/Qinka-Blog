模拟出租车与网约车应答的代码
\footnote{使用 Literate Haskell 方式（语言）编写}

开启编译器的特性
\begin{code}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE FlexibleInstances #-}
\end{code}

模块声明与导入模块声明
\begin{code}
module Main where
      import System.Random
      import Control.Monad.Random
      import Data.List
      import System.Environment
\end{code}

为二元祖实现 Random 类型类
\begin{code}
      instance Random a => Random ((,) a a) where
        random g = let (l,g')  = random g
                       (r,g'') = random g'
                       in ((l,r),g'')
        randomR ((x1,y1),(x2,y2)) g = ((l,r),g'')
          where
            (l,g')  = randomR (x1,x2) g
            (r,g'') = randomR (y1,y2) g'
\end{code}

实现浮点数的取模运算，来解决越界问题
\begin{code}
      modD :: Double -> Double -> Double
      modD a b
        | abs a > abs b = a - b*(fromIntegral $ round (abs a/abs b))
        | otherwise = a
\end{code}
基本数据类型的定义
\begin{code}
      type Location = (Double,Double)
      type Speed = Double
      type CustomDep = Double
      type Sqr = Double
      data SumLocation = SumLocation
        { didil :: [Location]
        , taxil :: [Location]
        } deriving (Show,Eq)
      data SumConfig = SumConfig
        { sumlo :: SumLocation
        , taxiSpd :: Speed
        , didiSpd :: Speed
        , cusDep :: CustomDep
        , carNum :: (Int,Int)
        , sqrtR :: Sqr
        } deriving (Show,Eq)
\end{code}
所用到的简化表达式的操作符
\begin{code}
      infixl 7 <^>
      (<^>) :: Double -> Double -> Double
      (<^>) x y = sqrt (x^2+y^2)
      infixl 4 .|
      (.|) :: Double -> Double -> Bool
      (.|) q x = x<=q && x>=(-q)
      infixl 4 <#>
      (<#>) :: (Functor f1, Functor f2)
            => (a -> b) -> f1 (f2 a) -> f1 (f2 b)
      (<#>) g = ((g <$>) <$>)
\end{code}
初始化配置的中位置的函数
\begin{code}
      initSumLocation :: SumConfig -> IO SumConfig
      initSumLocation sc@SumConfig{..} = do
        ts <- take (fst carNum) <$>
          getRandomRs ((-sqrtR,-sqrtR),(sqrtR,sqrtR))
        ds <- take (snd carNum) <$>
          getRandomRs ((-sqrtR,-sqrtR),(sqrtR,sqrtR))
        return $ sc { sumlo = SumLocation ts ds}
\end{code}
使用方式
\begin{span}
  initSumLocation (SumConfig undefined tSpd dSpd cD (dN,tN) sqr)
\end{span}
其中 tSqd 开始，分别为 出租车与网约车的速度，乘客可视距离，车辆的个数（网约车，出租车） 区域的面积

保留网约车中，离乘客最最近的一个
\begin{code}
      didiSumLocation :: SumConfig -> SumConfig
      didiSumLocation sc@SumConfig{..} = sc { sumlo = SumLocation [dl] (taxil sumlo) }
        where dl = head.sortOn (uncurry (<^>)) $ didil sumlo
\end{code}

计算网约车从接单（开始模拟）到乘客看见车的时间
\begin{code}
      didiTime :: SumConfig -> Double
      didiTime sc = d / spd
        where
          d =  max (x <^> y - cusDep sc) 0
          spd = didiSpd sc
          [(x,y)] = didil $ sumlo sc
\end{code}

计算出租车的对应时间，其中 upTimes 是上限时间所乘的倍数， st 是单次扫描时间间隔
\begin{code}
      taxiTime :: Double -> Double -> SumConfig -> IO Double
      taxiTime upTimes st sc =  holdAll 0 maxTime st sc
        where maxTime = (*upTimes).maximum.(uncurry (<^>) <$>). taxil $ sumlo sc
      holdAll :: Double -> Double -> Double -> SumConfig -> IO Double
      holdAll su up st sc
        | up < su = return su
        | is sc = return su
        | otherwise = do
            n <- nextSum st sc
            holdAll (su+st) up st n
\end{code}

计算下一次出租车位置的函数，其中 time 是单次扫描时间间隔
\begin{code}
      nextSum :: Double -> SumConfig -> IO SumConfig
      nextSum time sc@SumConfig{..} = do
        let l = length taxil
        rs <- take l <$> getRandomRs (0,2*pi)
        let ds = taxiSpd * time
        let ts = zipWith (\(x,y) c -> roundSqt sqrtR (x+ds*cos c,y+ds*sin c)) taxil rs
        return $ sc {sumlo = SumLocation didil ts}
        where
          SumLocation{..} = sumlo
      roundSqt :: Sqr -> Location -> Location
      roundSqt sq (x,y) = (x',y')
        where
          x' = if sq .| x then x else x `modD` sq
          y' = if sq .| y then y else y `modD` sq
      is   :: SumConfig -> Bool
      is sc = any ((<cusDep sc).uncurry (<^>)) taxil
        where SumLocation{..} = sumlo sc
\end{code}

主函数，依次接受 出租车速，网约车速，乘客可视半径，网约车辆数目，出租车车辆数目，模拟区域大小，上限时间倍数，与单次扫描时间。返回（输出到标准输出）的数据依次为 网约车响应时间与出租车响应时间，格式为csv的单行格式。
\begin{code}
      main :: IO ()
      main = do
        ts:ds:cd:dn:tn:sq:ut:st:_ <- read <#> getArgs
        sc <- didiSumLocation <$> initSumLocation (
          SumConfig undefined ts ds cd (round dn,round tn) sq)
        putStr $ show $ didiTime sc
        putStr ""
        print =<< taxiTime ut st sc
\end{code}

使用 Bash Shell 脚本，多次执行此代码，并用 awk 等命令，筛选整理结果。
