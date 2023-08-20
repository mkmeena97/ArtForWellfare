
import './App.css';
import { Link, Routes, Route } from 'react-router-dom';
import LoginComp from './component/loginComp';



function App() {
  return (
    <div className="App">
      <nav className="navbar navbar-expand-sm bg-light mb3">
        <div className="container-fluid">
          <ul  className="navbar-nav">                                                       
            <li className="nav-item">
            <Link to="/" className="nav-link px-3">Home</Link></li>
          
                                                          
            <li className="nav-item">
            <Link to="/" className="nav-link px-3">About</Link></li>

            <li className="nav-item">
            <Link to="/" className="nav-link px-3">Gallary</Link></li>
            <li className="nav-item">
            <Link to="/LoginComp" className="nav-link px-3">Login</Link></li>
          </ul>
        </div>
      </nav>

      <footer>
        <h1>WELCOME TO ART FOR WELLFARE</h1>
      </footer>

      <div>
        <ul className="md-4">
          <li><Link to="/LoginComp" className="nav-link px-3">Login</Link></li>
          
          <li><Link to="/" className="nav-link px-3">Register</Link></li>
          <li><Link to="/" className="nav-link px-3">Feedback</Link></li>
        </ul>
        
        

      
      </div>

      <Routes>
          <Route path="/LoginComp" element={<LoginComp/>}/>
        </Routes>

      



       
      
    
    </div>
  );
}

export default App;
