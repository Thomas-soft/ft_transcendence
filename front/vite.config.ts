// import { defineConfig } from 'vite'
// import vue from '@vitejs/plugin-vue'

// export default defineConfig({
//   plugins: [vue()],
//   css: {
//     preprocessorOptions: {
//       scss: {
//         api: 'modern-compiler', // or "modern"
//       }
//     }
//   }
// })

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  css: {
    preprocessorOptions: {
      scss: {
        api: 'modern-compiler', // or "modern"
      }
    }
  },
  server: {
    host: '0.0.0.0', // Rend le serveur accessible à d'autres conteneurs/machines
    port: 5173,       // Définit le port utilisé par Vite
    watch: {
      usePolling: true // Nécessaire dans Docker pour détecter les changements de fichiers
    },
    // proxy: {
    //   '/api': {
    //     target: 'http://localhost:8000', // Votre serveur Daphne
    //     changeOrigin: true,
    //     secure: false, // Accepter HTTP pour le dev
    //   },
    // },
  }
})

