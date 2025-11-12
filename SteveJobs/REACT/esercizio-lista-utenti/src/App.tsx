import { useState } from 'react'
import './App.scss'
import UserList from './components/UserList';

function App() {

  const [showUsers, setShowUsers] = useState<boolean>(false);

  return (
    <>
      <button onClick={() => setShowUsers(prev => !prev)}>
        {showUsers ? "Hide Users" : "Show Users"}
      </button>

      {showUsers && <UserList />}
    </>
  )
}

export default App
