return {
  cl = [[console.log($1)]],
  import = [[import $1 from '$2';]],
  reactinit = [[/**
* @module
*/

// =================== Library Imports ===================
import React from 'react';

// ==================== Local Imports ====================

// ==================== Style Imports ====================
import {} from './$1.module.css'

// =======================================================

/**
 * @param {object} p
 * @param {string} p.hello
 **/
function $1({ hello }) {
    return <div>{hello}</div>
}

export default $1;
]]
}
