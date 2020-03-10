{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hangman (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/bin"
libdir     = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/lib/x86_64-osx-ghc-8.8.2/hangman-0.1.0.0-8lm8x8L4V5aBbQx2uS95kz-hangman"
dynlibdir  = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/lib/x86_64-osx-ghc-8.8.2"
datadir    = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/share/x86_64-osx-ghc-8.8.2/hangman-0.1.0.0"
libexecdir = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/libexec/x86_64-osx-ghc-8.8.2/hangman-0.1.0.0"
sysconfdir = "/Users/Lester/Documents/Projecten/Haskell/Haskell-Programming-Solutions/Chapter 13/hangman/.stack-work/install/x86_64-osx/469af2d9a7f51fc77dcef4a2d00e8b8bb76ee5e26bcc2df2774a08138078511b/8.8.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hangman_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hangman_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hangman_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hangman_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hangman_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hangman_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
