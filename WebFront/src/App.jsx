import React, { useState, useCallback } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import Main from './pages/MainTutorial';
import Datos from './pages/Datos';
import CrearC from './pages/CrearCategoria';
import CrearP from './pages/CrearPalabra';
import EditarC from './pages/EditarCategoria';
import EditarP from './pages/EditarPalabra';

import Sidebar from './components/Sidebar';
import Fondo from './components/Fondo';

import './styles/App.scss'
import "./styles/SideBar.scss"
import "./styles/Fondo.scss"

function App() {
 
  const [isSidebarOpen, setIsSidebarOpen] = useState(false); // Estado para controlar la visibilidad del sidebar

  const toggleSidebar = useCallback(() => {  // Función para cambiar el estado del sidebar
    setIsSidebarOpen(prevState => !prevState);
  }, []);

  return (
    <Router>
      <div className='App'>
        <button className="burgerContainer" onClick={toggleSidebar}></button>
        <div className={`sidebar ${isSidebarOpen ? 'open' : ''}`}>
            <Sidebar />
        </div>
        <Fondo />
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/datos" element={<Datos />} />
          <Route path="/crear-categoria" element={<CrearC />} />
          <Route path='/crear-palabra' element={<CrearP />} />
          <Route path='/editar-categoria' element={<EditarC />} />
          <Route path='/editar-palabra' element={<EditarP />} />
        </Routes>
      </div>

    </Router>

  )
}

export default App;
