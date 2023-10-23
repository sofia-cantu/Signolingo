import React, { useEffect, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import NavbarUser from '../components/NavbarUser';
import Sidebar from '../components/Sidebar';
import jsonData from './getAllCategories.json'; // Assuming this JSON file is valid
import wordsData from './getAllWords.json'; // Assuming this JSON file is valid
import axios from 'axios';
import { Link } from 'react-router-dom';


import './EditCategory.css';


function EditWord() {
  const [categories, setCategories] = useState([]);
  const [words, setWords] = useState([]); 


  useEffect(() => {
    axios.get('https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/categories/getall')
      .then(res => {
        console.log('API Response category:', res.data);
        setCategories(res.data.categories);
        // Fetch words data once categories data is available
        axios.get('https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/words/getall')
          .then(res => {
            console.log('API Response words:', res.data);
            setWords(res.data.words);
          })
          .catch(err => console.log('API Error:', err));
      })
      .catch(err => console.log('API Error:', err));
  }, []);

  const [expandedCategoryId, setExpandedCategoryId] = useState(null);

  const buttons = [
    { label: 'Editar Palabra', link: '/create-category' },
    { label: 'Tutorial', link: '/create-category-tutorial' },
  ];

  const toggleExpansion = (categoryId) => {
    if (expandedCategoryId === categoryId) {
      setExpandedCategoryId(null);
    } else {
      setExpandedCategoryId(categoryId);
    }
  };

  return (
    <>
      <Sidebar />
        <div className='navbar'> 
          <NavbarUser buttons={buttons} />
        </div>
        <div className="containerFor">
         <div className="row">
         <div className="col">
            <h1 className='base-datos'>Base de datos</h1>
            <h2 className='palabras-actuales'>Palabras actuales</h2>

          {categories.map((category) => (
          <div className='box' key={category.id}>
          <button onClick={() => toggleExpansion(category.id)}>  
            {expandedCategoryId === category.id ? '▼' : '▲'}{category.name} 
          </button>
          {expandedCategoryId === category.id && (
          <div>
          {words
          .filter(word => word.categoryid === category.id)
          .map(matchingWordData => (
            <div key={matchingWordData.id}>
               <Link to={`/update-word/${matchingWordData.id}`}>{matchingWordData.word}</Link>
            </div>
          ))}
          </div>
          )}
        </div>
      ))}
      </div>
    </div>
  </div>    
    </>
  );
}


export default EditWord;
