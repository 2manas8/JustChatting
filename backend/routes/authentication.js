const express = require('express')
const router = express.Router()

const {signUp} = require('../controllers/signUp')
router.post('/signup', signUp)

const {login} = require('../controllers/login')
router.post('/login', login)

module.exports = router