const { Marp } = require('@marp-team/marp-core');
module.exports = (opts) => new Marp(opts)
  .use(require('markdown-it-anchor'))
  .use(require('markdown-it-attrs'))
  .use(require('markdown-it-div'))
  .use(require('markdown-it-implicit-figures'))
  .use(require('markdown-it-mark'))
  .use(require('@gerhobbelt/markdown-it-inline-text-color'))
;
