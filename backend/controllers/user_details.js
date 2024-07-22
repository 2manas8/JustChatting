const User = require('../models/user')

const otherUsersFilter = (myUsername, users) => {
    const otherUsers = []
    for(const user of users) {
        if(user.username != myUsername) {
            otherUsers.push(user)
        }
    }
    return otherUsers
}

exports.userDetails = async (req, res) => {
    try {
        const myUsername = req.query.my_username
        const username = req.query.username
        const users = await User.find({username: new RegExp(username)})
        const otherUsers = otherUsersFilter(myUsername, users)
        if(users.length == 0) {
            return res.status(400).json({message: 'User does not exist'})
        }
        const userDetails = otherUsers.map((user) => ({
            userId: user._id,
            name: user.name,
            username: user.username
        }))
        res.status(200).json({
            message: 'User found',
            users: userDetails
        })
    } catch(error) {
        console.log(error)
        res.status(500).json({message: 'Internal Server Error'})
    }
}