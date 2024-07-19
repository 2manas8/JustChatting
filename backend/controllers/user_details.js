const User = require('../models/user')

exports.userDetails = async (req, res) => {
    try {
        const userId = req.query._id
        const username = req.query.username
        const user = userId ? await User.findOne({_id: userId}) : await User.findOne({username: username})
        if(!user) {
            return res.status(400).json({message: 'User does not exist'})
        }
        res.status(200).json({
            message: 'User found',
            userId: user._id,
            name: user.name,
            username: user.username
        })
    } catch(error) {
        console.log(error)
        res.status(500).json({message: 'Internal Server Error'})
    }
}