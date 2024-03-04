import React from 'react'

//import Icon from "../assets/Icon.svg";
//<img src={Icon} alt="icon" className="logo" />
import Dashboard from "../assets/dashboard.svg";
import Transactions from "../assets/transactions.svg";
import Performance from "../assets/performance.svg";
import News from "../assets/news.svg";
import Settings from "../assets/settings.svg";
import Support from "../assets/support.svg";

import logoSimple from '../assets/LogoSimple.png';

const Sidebar = () => {
  return (
    
    <div className="sidebar">

      <div className="logoContainer">
        <a href="https://diloensenas.org/" target="_blank">
          <img src={logoSimple} className="logo" alt="Dilo en Señas logo" />
        </a>
        <h2 className="title">Diccionario en Señas</h2>
      </div>

      <div className="burgerContainer">
        <div className="burgerTrigger"></div>
        <div className="burgerMenu"></div>
      </div>

      <div className="profileContainer">
        <div className="profileContents">
          <p className="name">Hola, Caro.</p>
        </div>
      </div>

      <div className="contentsContainer">
        <ul>
          <li>
            <img src={Dashboard} alt="svg temporal" />
            <a href="/">Pagina principal</a>
          </li>

          <li>
            <img src={Transactions} alt="svg temporal" />
            <a href="/datos">Datos</a>
          </li>

          <li>
            <img src={Performance} alt="svg temporal" />
            <a href="/crear-categoria">Crear categoría</a>
          </li>

          <li>
            <img src={News} alt="svg temporal" />
            <a href="/crear-palabra">Crear palabra</a>
          </li>

          <li>
            <img src={Settings} alt="svg temporal" />
            <a href="/editar-categoria">Editar categoria</a>
          </li>

          <li>
            <img src={Support} alt="svg temporal" />
            <a href="/editar-palabra">Editar palabra</a>
          </li>


        </ul>
      </div>

    </div>
  )
}

export default Sidebar;