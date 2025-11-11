// // import type { HeaderProps } from "../types/header";

// // Oppure si può fare così , senza l'importazione da un file esterno
// type HeaderProps = {
//     // il ? indica che la proprietà è opzionale
//   title?: string;
// };

// const Header = ({ title = "Default title" }: HeaderProps) => {
    
//     // Per ottimizzare nel caso in cui il titolo non venga passato
//     // if (!title) return null;

//   return (
//     <nav>
//         <h1>HEADER TITLE: {title}</h1>
//     </nav>
//   );
// };

// export default Header;

export function Header() {
    return (
        <nav>
            <h1>HEADER</h1>
        </nav>
    );
}

export default Header;