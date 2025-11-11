import { useState } from 'react'
import './App.scss'
import Header from './components/Header';
import Products from './components/Products';
// import Counter from './components/Counter';


const App = () => {
  // const [counter, setCounter] = useState<number>(0);
  const [showProducts, setShowProducts] = useState<boolean>(false);

  return (
    <> 
      <Header />

      {/* <Counter count={counter} setCount={setCounter} /> */}
      
      <button onClick={() => setShowProducts(prev => !prev)}>
        {showProducts ? "Nascondi" : "Mostra"}
      </button>
      
      {showProducts && <Products />}
    </>
  )
}

export default App
