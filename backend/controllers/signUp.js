const User = require('../models/user')
const bcrypt = require('bcryptjs')

exports.signUp = async (req, res) => {
    try {
        const name = req.body.name
        const username = req.body.username
        const email = req.body.email
        const phone = req.body.phone
        const existingUsername = await User.findOne({username: username})
        const existingEmail = await User.findOne({email: email})
        const existingPhone = await User.findOne({phone: phone})
        if(existingUsername && existingEmail && existingPhone) {
            return res.status(400).json({message: "Account already exists"})
        } else if(existingUsername) {
            return res.status(400).json({message: "Username already exists"})
        } else if(existingEmail) {
            return res.status(400).json({message: "E-mail already exists"})
        } else if(existingPhone) {
            return res.status(400).json({message: "Phone number already exists"})
        }
        const salt = await bcrypt.genSalt(10)
        const password = await bcrypt.hash(req.body.password, salt)
        const saveUser = await User.create({
            name: name,
            username: username,
            email: email,
            phone: phone,
            password: password
        })
        res.status(200).json({message: "User registered", user: saveUser})
    } catch(error) {
        console.log(error)
        res.status(500).json({message: "Internal Server Error"})
    }
}