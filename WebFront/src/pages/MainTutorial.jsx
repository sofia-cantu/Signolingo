import React from 'react'

const colores = {
  azul: '#003381',
  rosa: '#9f1e8d',
};

const MainTutorial = () => {
    return (
        <div className="paginas">
            <h1>Bienvenido al <span style={{color: colores.azul}}>editor</span> de contenido de <span style={{color: colores.rosa}}>Diccionario de Señas</span></h1>
            <br/>
            <h2>Hola</h2>
            <p>Tutorial de la pagina Tutorial de la pagina Tutorial de la pagina Tutorial de la pagina...</p>
        </div>
    )
}

export default MainTutorial;
