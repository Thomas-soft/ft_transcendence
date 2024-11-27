import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
// import { fileURLToPath, URL } from 'node:url';

// https://vite.dev/config/
// export default defineConfig({
// })


export default defineConfig({
  plugins: [vue()],
  // resolve: {
  //   alias: {
  //     '@': fileURLToPath(new URL('./src', import.meta.url)), // Alias pour "src"
  //   },
  // },
  css: {
    preprocessorOptions: {
      scss: {
        api: 'modern-compiler', // or "modern"
        // additionalData: `@import "@/style.scss";`, // Chemin vers ton fichier global
      }
    }
  }
})