import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        slatebrand: '#102133',
        mintbrand: '#62e6c8',
      },
    },
  },
  plugins: [],
};

export default config;
