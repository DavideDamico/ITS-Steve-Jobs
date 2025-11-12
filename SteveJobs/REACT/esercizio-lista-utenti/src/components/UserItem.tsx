import type { UserType } from '../types/user';
import './UserItem.scss';

type UserItemProps = {
    user: UserType;
    onDelete: (userId: number) => void;
};

const UserItem = ({ user, onDelete }: UserItemProps) => {

    const localDeleteUser = () => {
        onDelete(user.id);
    };

    return (
        <div className="user-item">
            <h3>{user.name}</h3>
            <p>{user.email}</p>
            <button onClick={localDeleteUser}>Delete</button>
        </div>
    );
}

export default UserItem;
