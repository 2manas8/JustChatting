const express = require('express')
const router = express.Router()

const {signUp} = require('../controller/signUp')
router.post('/signup', signUp)

const {login} = require('../controller/login')
router.get('/login', login)

module.exports = router