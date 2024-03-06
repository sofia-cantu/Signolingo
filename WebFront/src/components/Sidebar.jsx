import React from 'react'

//import Icon from "../assets/Icon.svg";
//<img src={Icon} alt="icon" className="logo" />
import Casa from "../assets/casa.svg";
import Datos from "../assets/datos.svg";
import CrearC from "../assets/crearC.svg";
import CrearP from "../assets/crearP.svg";
import EditarC from "../assets/editarC.svg";
import EditarP from "../assets/editarP.svg";

import logoSimple from '../assets/LogoSimple.png';

const Sidebar = () => {
  return (
    
    <div className="sidebar">

      <div className="logoContainer">
        <a href="https://diloensenas.org/" target="_blank">
          <img src={logoSimple} className="logo" alt="Dilo en Señas logo"/>
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
            <img src={Casa} alt="svg temporal" class="SideBarSVG" />
            <a href="/">Pagina principal</a>
          </li>

          <li>
            <img src={Datos} alt="svg temporal" class="SideBarSVG" />
            <a href="/datos">Datos</a>
          </li>

          <li>
            <img src={CrearC} alt="svg sidebar" class="SideBarSVG" />
            <a href="/crear-categoria">Crear categoría</a>
          </li>

          <li>
            <img src={CrearP} alt="svg sidebar" class="SideBarSVG" />
            <a href="/crear-palabra">Crear palabra</a>
          </li>

          <li>
            <img src={EditarC} alt="svg sidebar" class="SideBarSVG" />
            <a href="/editar-categoria">Editar categoria</a>
          </li>

          <li>
            <img src={EditarP} alt="svg sidebar" class="SideBarSVG" />
            <a href="/editar-palabra">Editar palabra</a>
          </li>


        </ul>
      </div>

    </div>
  )
}

export default Sidebar;