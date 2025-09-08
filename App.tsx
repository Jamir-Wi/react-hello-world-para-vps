
import React from 'react';

const App: React.FC = () => {
  return (
    <main className="bg-gray-900 text-white min-h-screen flex flex-col items-center justify-center font-sans">
      <div className="text-center p-8 bg-gray-800 rounded-2xl shadow-2xl border border-gray-700 transform hover:scale-105 transition-transform duration-300">
        <h1 className="text-5xl md:text-7xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-purple-400 to-pink-600 mb-4">
          Olá Mundo!
        </h1>
        <p className="text-lg md:text-xl text-gray-300">
          Esta aplicação React está pronta para deploy.
        </p>
        <div className="mt-6 text-sm text-gray-500">
          <p>Powered by React, TypeScript & Tailwind CSS</p>
        </div>
      </div>
    </main>
  );
};

export default App;
