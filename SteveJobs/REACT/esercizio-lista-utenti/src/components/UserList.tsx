import { useEffect, useState } from 'react';
import type { UserType } from '../types/user';
import UserItem from './UserItem';

const Users = () => {
    const [users, setUsers] = useState<UserType[]>([]);

    const getUsers = async () => {
        setTimeout(() => { 
            fetch('https://jsonplaceholder.typicode.com/users')
                .then(response => response.json())
                .then(data => setUsers(data))
                .catch(error => console.error('Error fetching users:', error));
        }, 1000);
    };  
    
    useEffect(() => {
        getUsers();
    }, []);

    const deleteUser = (userId: number) => {
        setUsers(users.filter(user => user.id !== userId));
    };

    return (
        <section>
            <h2>Users List:</h2>

            <div className='user-list-container'>
                {users.map((user: UserType) => {
                    return (
                        <UserItem key={user.id} user={user} onDelete={deleteUser} />
                    );
                })}
            </div>
        </section>
    );
}

export default Users;
