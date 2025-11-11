import { useCallback, useEffect } from "react";

type CounterProps = {
    count: number;
    setCount: React.Dispatch<React.SetStateAction<number>>;
};

const Counter: React.FC<CounterProps> = ({ count, setCount }) => {

    const increment = () => {
        setCount((prevCount) => prevCount + 1);
    };

    const getCounter = useCallback(() => {
        console.log("getCounter called", count);
        return count;
    }, [count]);

    // ON COUNT CHANGE
    useEffect(() => {
        getCounter();
    }, [getCounter]);

    return (
        <div className="counter-container">
            <p>Counter: {count}</p>
            <button onClick={increment}>Increment</button>
        </div>
    );
}

export default Counter;