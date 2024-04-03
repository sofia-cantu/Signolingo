//Basico
/*import React from 'react'

const Datos = () => {
    return (
        <div class="paginas">
            <h1>Donde se muestran los Datos</h1>
            <p> Aqui quiero qe se muestre la información</p>
        </div>
      )
}

export default Datos
*/

import React, { useState, useEffect } from 'react';

const Datos = () => {
    // State to store the fetched words
    const [words, setWords] = useState([]);
    const [categories, setCategories] = useState([]);

    // Effect to fetch data from the API on component mount
    useEffect(() => {
        const fetchWords = async () => {
            const response = await fetch('https://c9x08l7v-3000.usw3.devtunnels.ms/api/v1/words/getall');
            const data = await response.json();
            setWords(data.words);
        };

        const fetchCategories = async () => {
            const response = await fetch('https://c9x08l7v-3000.usw3.devtunnels.ms/api/v1/categories/getall');
            const data = await response.json();
            setCategories(data.categories);
        };

        fetchWords();
        fetchCategories();
    }, []); // Empty dependency array means this effect runs once on mount

    // Función para encontrar el nombre de una categoría por ID
    const getCategoryName = (id) => {
        const category = categories.find((category) => category.id === id);
        return category ? category.name : 'Categoría desconocida';
    };

    // Función para encontrar la palabra por ID
    const getWordById = (id) => {
        const word = words.find((word) => word.id === parseInt(id));
        return word ? word.word : 'Palabra desconocida';
    };

    return (
        <div className="paginas" style={{ maxHeight: '100vh', overflowY: 'auto' }}>
            <h1>Datos</h1>
            <p>Palabras regisadas:</p>
            <div>
                {words.map((word) => (
                    <div key={word.id}>
                        <h2>{word.word} <span>(id: {word.categoryid})</span></h2>
                        <p>
                            Categoría: {getCategoryName(word.categoryid)} (id: {word.categoryid})<br/>
                            Definición: {word.definition}<br/>
                            Primera palabra recomendada: {word.suggested1}<br/>
                            Segunda palabra recomendada: {word.suggested2}<br/>
                            Liga de la imagen: {word.image}<br/>
                            Liga del video: {word.video}<br/>
                            Liga del audio: {word.audio}
                            Escaneo: {word.isscannable.toString()}<br/>
                        </p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default Datos;
