import React from 'react'
import Azul from "../assets/azul.svg";
import Rosa from "../assets/rosa.svg";

const Fondo = () => {
  return (
    <div class="svgFondo">
        <img src={Azul} alt="svg fondo" class="svgFondo" id="abajo" />
        <img src={Rosa} alt="svg fondo" class="svgFondo" id="arriba" />
    </div>
  )
}

export default Fondo