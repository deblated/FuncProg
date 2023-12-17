module MenuModule(showMainMenu) where
import Database.SQLite.Simple
import UsersMenu
import SoftwareMenu
import AbstractMenu
import DistributionMenu
import StatisticsMenu
import PopularityMenu

showMainMenu :: Connection -> IO()
showMainMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Users")
    putStrLn("2) Software")
    putStrLn("3) Abstract")
    putStrLn("4) Distribution")
    putStrLn("5) Statistics")
    putStrLn("6) Popularity")

    putStrLn("7) Exit")

    resp <- getChar
    _ <- getLine

    case resp of
        '1' -> usersMenu conn
        '2' -> softwareMenu conn
        '3' -> abstractMenu conn
        '4' -> distributionMenu conn
        '5' -> statisticsMenu conn
        '6' -> popularityMenu conn
        _ -> putStrLn("")

    if resp /= '7'
        then showMainMenu conn
    else putStrLn("")

usersMenu :: Connection -> IO()
usersMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show users")
    putStrLn("2) Add user")
    putStrLn("3) Edit user")
    putStrLn("4) Delete user")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showUsers conn
        '2' -> addUser conn
        '3' -> editUser conn
        '4' -> deleteUser conn
        _ -> putStrLn("")

softwareMenu :: Connection -> IO()
softwareMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show software")
    putStrLn("2) Add software")
    putStrLn("3) Edit software")
    putStrLn("4) Delete software")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showSoft conn
        '2' -> addSoft conn
        '3' -> editSoft conn
        '4' -> deleteSoft conn
        _ -> putStrLn("")

abstractMenu :: Connection -> IO()
abstractMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show abstracts")
    putStrLn("2) Add abstract")
    putStrLn("3) Edit abstract")
    putStrLn("4) Delete abstract")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showAbs conn
        '2' -> addAbs conn
        '3' -> editAbs conn
        '4' -> deleteAbs conn
        _ -> putStrLn("")

distributionMenu :: Connection -> IO()
distributionMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show distributions")
    putStrLn("2) Add distribution")
    putStrLn("3) Edit distribution")
    putStrLn("4) Delete distribution")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showDist conn
        '2' -> addDist conn
        '3' -> editDist conn
        '4' -> deleteDist conn
        _ -> putStrLn("")

statisticsMenu :: Connection -> IO()
statisticsMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show statistics")
    putStrLn("2) Add statistics")
    putStrLn("3) Edit statistics")
    putStrLn("4) Delete statistics")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showStats conn
        '2' -> addStats conn
        '3' -> editStats conn
        '4' -> deleteStats conn
        _ -> putStrLn("")

popularityMenu :: Connection -> IO()
popularityMenu conn = do
    putStrLn("Select option:")
    putStrLn("1) Show popularity")
    putStrLn("2) Add popularity")
    putStrLn("3) Edit popularity")
    putStrLn("4) Delete popularity")
    putStrLn("5) Exit")

    resp <- getChar
    _ <- getLine
    
    case resp of
        '1' -> showPop conn
        '2' -> addPop conn
        '3' -> editPop conn
        '4' -> deletePop conn
        _ -> putStrLn("")