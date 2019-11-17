// ------ JavaScript
import babel from 'rollup-plugin-babel';
import { eslint } from 'rollup-plugin-eslint';
import { terser } from 'rollup-plugin-terser';
import commonjs from 'rollup-plugin-commonjs';

// ------ postCSS
import postcss from 'rollup-plugin-postcss';
import atImport from 'postcss-import';
import selector from 'postcss-custom-selectors';
import customProperties from 'postcss-custom-properties';
import sorting from 'postcss-sorting';
import nested from 'postcss-nested';

// ------ global
import resolve from 'rollup-plugin-node-resolve';
import browsersync from 'rollup-plugin-browsersync';

const plugins = [
  eslint({
    exclude: [
      'src/css/**'
    ]
  }),
  babel({
    exclude: 'node_modules/**',
    include: 'src/js/**',
    presets: ['@babel/preset-env']
  }),
  terser(),
  browsersync({
    host: 'localhost',
    port: 3000,
    server: {
      baseDir: ['./']
    },
    files: [
      'src/**',
      'csv/*.*',
      './*.html'
    ],
    open: true
  }),
  resolve(),
  commonjs()
];


export default [{
    input: 'src/js/index.js',
    output: {
      file: 'js/index.js',
      format: 'esm'
    },
    plugins
  },
  {
    input: 'src/js/d3.js',
    output: {
      file: 'js/d3.min.js',
      format: 'umd',
      name: 'd3',
      moduleName: 'd3',
      external: ['d3']
    },
    plugins
  },
  {
    input: 'src/css/styles.css',
    output: {
      file: 'css/style.css',
      format: 'es'
    },
    plugins: [
      postcss({
        extract: true,
        sourceMap: true,
        plugins: [
          atImport(),
          selector(),
          customProperties(),
          sorting(),
          nested()
        ],
        extensions: ['.css'],
        minimize: true
      })
    ]
  },
  {
    watch: {
      include: ['src/**', './*.html']
    }
  }
];
