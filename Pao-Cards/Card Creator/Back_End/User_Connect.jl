using("Models/User.jl")
using("Models/Card.jl")

#import .User_mod
#import .Card_mod

function getUser(x, y)

end

function createUser(userName, password, email, dateOfBirth)
    
    #Need to check to see if username already exists
    try
        SQLite.execute(db, "INSERT INTO Users (userName) VALUES ('$userName')")

        catch
            println("Unable to create user")
    end

    try
        SQLite.execute(db, "UPDATE Users SET email = '$email' WHERE userName = '$userName'")
        catch
            println("Error when adding email")
    end

    try
        SQLite.execute(db, "UPDATE Users SET email = '$email' WHERE userName = '$userName'")
        catch
            println("Error when adding card type")
    end

end

function createAdminUser(userName, password, email, dateOfBirth) 

end

function login(userName, password)

end

function logout()

end