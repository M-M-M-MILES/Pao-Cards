using("Models/User.jl")
using("Models/Card.jl")

#import .User_mod
#import .Card_mod

function getUser(x, y)
    currentUser = SQLite.execute(db, "SELECT * FROM Users WHERE userId = ('$x')")
    user = SQLite.execute(db, "SELECT * FROM Users WHERE userId = ('$y')")

    if(currentUser.userId = user.userId || currentUser.userRole = "Admin")
        return user
    else
        return user.userName + user.level + user.rank
    end
end

function createUser(userName, password, email, dateOfBirth)
    #need to add troubleshooting (checking if a user already exists, if passwords/emails match, etc)
    SQLite.execute(db, "INSTER INTO Users (userName) VALUES ('$userName')")
    SQLite.execute(db, "INSTER INTO Users (password) VALUES ('$password')")
    SQLite.execute(db, "INSTER INTO Users (email) VALUES ('$email')")
    SQLite.execute(db, "INSTER INTO Users (dateOfBirth) VALUES ('$dateOfBirth')")
    SQLite.execute(db, "INSTER INTO Users (userRole) VALUES ('Player')")
    SQLite.execute(db, "INSTER INTO Users (level) VALUES ('1')")
    SQLite.execute(db, "INSTER INTO Users (rank) VALUES ('No Rank')")
end

function createAdminUser(userName, password, email, dateOfBirth) 
    #need to add troubleshooting (checking if a user already exists, if passwords/emails match, etc)
    #in the future, this will change, but this should work for now
    SQLite.execute(db, "INSTER INTO Users (userName) VALUES ('$userName')")
    SQLite.execute(db, "INSTER INTO Users (password) VALUES ('$password')")
    SQLite.execute(db, "INSTER INTO Users (email) VALUES ('$email')")
    SQLite.execute(db, "INSTER INTO Users (dateOfBirth) VALUES ('$dateOfBirth')")
    SQLite.execute(db, "INSTER INTO Users (userRole) VALUES ('Admin')")
    SQLite.execute(db, "INSTER INTO Users (level) VALUES ('1')")
    SQLite.execute(db, "INSTER INTO Users (rank) VALUES ('No Rank')")
end