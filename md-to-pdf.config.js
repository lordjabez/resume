// Settings for md-to-pdf. Fonts are loaded from the repo rather than the OS
// so text metrics, and therefore page breaks, are identical wherever it's built.
module.exports = {
  document_title: 'Judson Neer Résumé',
  pdf_options: {
    format: 'Letter',
    margin: '16mm',
  },
  css: `
    @font-face { font-family: 'Inter'; font-style: normal; font-weight: 400; src: url('fonts/Inter-Regular.woff2') format('woff2'); }
    @font-face { font-family: 'Inter'; font-style: italic; font-weight: 400; src: url('fonts/Inter-Italic.woff2') format('woff2'); }
    @font-face { font-family: 'Inter'; font-style: normal; font-weight: 700; src: url('fonts/Inter-Bold.woff2') format('woff2'); }
    body { font-family: 'Inter', sans-serif; }
  `,
};
