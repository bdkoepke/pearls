module Paths_pearls (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/bkoepke/src/pearls/.cabal-sandbox/bin"
libdir     = "/home/bkoepke/src/pearls/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.1/pearl_Cr46suKoG3N3m5jsP5EJy6"
datadir    = "/home/bkoepke/src/pearls/.cabal-sandbox/share/x86_64-linux-ghc-7.10.1/pearls-0.1.0.0"
libexecdir = "/home/bkoepke/src/pearls/.cabal-sandbox/libexec"
sysconfdir = "/home/bkoepke/src/pearls/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pearls_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pearls_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "pearls_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pearls_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pearls_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
