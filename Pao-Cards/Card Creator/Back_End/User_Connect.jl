import Pkg; Pkg.add("Genie")
import Pkg; Pkg.add("DataFrames")
import Pkg; Pkg.add("JSONTables")

using Genie, DataFrames, JSONTables
using Genie.Router, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json, Genie.Requests


include("Models/User.jl")
include("Models/Card.jl")
include("database.jl")

#import .User_mod
#import .Card_mod

function getUser(username)
    try
        cur = DBInterface.execute(db, "SELECT * FROM Users WHERE userName = '$username'")
        df = DataFrame(cur)
        stringJSON = arraytable(df)
        return stringJSON
        catch
            println("Error returning user")
     end
end

route("/getUser", method = GET) do

    return getUser(getpayload(:userName))
     
end

function createUser(userName, password, email, dateOfBirth)
    
    #Need to check to see if username already exists
    try
        SQLite.execute(db, "INSERT INTO Users (userName) VALUES ('$userName')")

        catch
            println("Unable to create user")
    end

    try
        SQLite.execute(db, "UPDATE Users SET password = '$password' WHERE userName = '$userName'")
        catch
            println("Error when adding password")
    end

    try
        SQLite.execute(db, "UPDATE Users SET email = '$email' WHERE userName = '$userName'")
        catch
            println("Error when adding email")
    end

    try
        SQLite.execute(db, "UPDATE Users SET dateOfBirth = '$dateOfBirth' WHERE userName = '$userName'")
        catch
            println("Error when adding date of birth")
    end

    try
        SQLite.execute(db, "UPDATE Users SET userRole = User WHERE userName = '$userName'")
        catch
            println("Error when adding user role")
    end

    try
        SQLite.execute(db, "UPDATE Users SET level = 1 WHERE userName = '$userName'")
        catch
            println("Error when adding user level")
    end

end

route("/createUser", method = POST) do
    createUser(jsonpayload()["userName"], jsonpayload()["password"], jsonpayload()["email"], jsonpayload()["dateOfBirth"])
    return "POST OK"
end

function changeUserRole(userName, role) 
    try
        SQLite.execute(db, "UPDATE Users SET userRole = '$role' WHERE userName = '$userName'")
        catch
            println("Error when trying to change user role")
    end
end

route("/changeUserRole", method = PUT)do
    changeUserRole(jsonpayload()["userName"],jsonpayload()["role"])
        return "POST OK"
end

function login(userName, password)

end

function logout()

end

up(8004, async = false)