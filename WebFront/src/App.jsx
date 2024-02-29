import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import CrearC from './pages/CrearCategoria';
import CrearP from './pages/CrearPalabra';
import EditarC from './pages/EditarCategoria';
import EditarP from './pages/EditarPalabra';
import Sidebar from './components/Sidebar';

import './App.css'
import "./styles/main.scss"
//import logoSimple from './assets/LogoSimple.png'

/*
<a href="https://diloensenas.org/" target="_blank">
  <img src={logoSimple} className="logo" alt="Dilo en Señas logo" />
</a>
*/

function App() {
 
  return (
    <Router>
      <div className='App'>
        <Sidebar />
        <Routes>
          <Route path="/" element={<CrearC />} />
          <Route path='/crear-palabra' element={<CrearP />} />
          <Route path='/editar-categoria' element={<EditarC />} />
          <Route path='/editar-palabra' element={<EditarP />} />
        </Routes>

      </div>

    </Router>

  )
}

export default App;
