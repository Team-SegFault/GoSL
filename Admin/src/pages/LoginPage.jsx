import { useState } from 'react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Card, CardContent, CardFooter, CardHeader } from "@/components/ui/card"
import { useNavigate } from 'react-router-dom'
import axios from 'axios'

export default function LoginPage() {
  const [username, setUsername] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const navigate = useNavigate()

  const handleSubmit = async (e) => {
    e.preventDefault()
    try {
      const response = await axios.post('http://gosl.lakindu.me/api/login', {
        username,
        password
      })
      if (response.status === 200) {
        navigate('/')
      } else {
        alert('Login failed')
      }
    } catch (error) {
      console.error('Error during login:', error)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100">
      <Card className="w-full max-w-md">
      <CardHeader className="space-y-1 flex flex-col items-center">
          <div className="h-20 mb-4 flex items-center justify-center rounded-full">
            {/* Replace with your actual logo */}
            <img src="/logo.png" className="h-10" />
            {/* <LockIcon className="h-10 w-10 text-primary-foreground" /> */}
          </div>
          <h2 className="text-2xl font-bold text-center">Login to Your Account</h2>
          <p className="text-sm text-muted-foreground text-center">
            Enter your email and password to access your account
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit}>
            <div className="mb-4">
              <Label htmlFor="username">Username</Label>
              <Input
                id="username"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>
            <div className="mb-4">
              <Label htmlFor="password">Password</Label>
              <Input
                id="password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            <Button type="submit">Login</Button>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}