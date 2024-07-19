require('dotenv').config()
const User = require('../models/user')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

exports.login = async (req, res) => {
    try {
        const username = req.body.username
        const user = await User.findOne({username})
        if(!user) {
            return res.status(400).json({message: "Incorrect credentials"})
        }
        const passwordCompare = await bcrypt.compare(req.body.password, user.password)
        if(!passwordCompare) {
            return res.status(400).json({message: "Incorrect credentials"})
        }
        res.status(200).json({
            token: jwt.sign({
                id: user._id,
                name: user.name,
                email: user.email,
                phone: user.phone
            }, process.env.JWT_SECRET)
        })
    } catch(error) {
        console.log(error)
        res.status(500).json({message: "Internal Server Error"})
    }
}