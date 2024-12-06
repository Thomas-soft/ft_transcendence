import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { ASPECT_RATIO, CAMERA_POSITION, FOV } from './constants'
import Area from './Area'
import Ball from './Ball'
import Paddle from './Paddle'

class StateGame
{
    constructor()
    {
        this.canvas = null
        this.scene = null
        this.camera = null
        this.renderer = null

        this.controls = null

        this.ambientLight = null
        this.Area = null
        this.Ball = null
        this.LeftPaddle = null
        this.RightPaddle = null

        this.resize_handler = null
        this.keydown_handler = null
        this.keyup_handler = null

        this.isAnimating = false
        this.animation_id = null
    }

    init()
    {
        this.keyPressed = { up: false, down: false }
        this.scene = new THREE.Scene()
        this.camera = new THREE.PerspectiveCamera(FOV, window.innerWidth / window.innerHeight, 0.1, 1000)
        this.camera.position.x = CAMERA_POSITION[0]
        this.camera.position.y = CAMERA_POSITION[1]
        this.camera.position.z = CAMERA_POSITION[2]
        this.renderer = new THREE.WebGLRenderer()
        this.renderer.setSize(window.innerWidth, window.innerHeight)
        document.querySelector(".pong").appendChild(this.renderer.domElement)
        this.canvas = this.renderer.domElement

        // Contrôles Orbit
        this.controls = new OrbitControls(this.camera, this.renderer.domElement)
        this.controls.enableDamping = true // Ajoute un effet d'inertie
        this.controls.dampingFactor = 0.05 // Facteur d'inertie
        this.controls.enableZoom = true // Permet de zoomer avec la molette
        this.controls.target.set(0, 0, 0) // Point que la caméra regarde
        this.controls.update()

        this.ambientLight = new THREE.AmbientLight(0xffffff, 1) // Lumière ambiante douce
        this.Area = new Area()
        this.Ball = new Ball()
        this.LeftPaddle = new Paddle(-4.5, 0)
        this.RightPaddle = new Paddle(4.5, 0)
        this.scene.add(this.ambientLight)
        this.scene.add(this.Area.mesh)
        this.scene.add(this.Ball.mesh)
        this.scene.add(this.LeftPaddle.mesh)
        this.scene.add(this.RightPaddle.mesh)

        this.resize_handler = this.onWindowResize.bind(this)
        this.keydown_handler = this.onKeyDown.bind(this)
        this.keyup_handler = this.onKeyUp.bind(this)

        window.addEventListener('resize', this.resize_handler)
        window.addEventListener('keydown', this.keydown_handler)
        window.addEventListener('keyup', this.keyup_handler)

        this.renderer.render(this.scene, this.camera)
        this.startAnimation()
        this.onWindowResize()
    }

    animate = () =>
    {
        if (!this.isAnimating)
            return
        // Demande la prochaine frame
        this.animationId = requestAnimationFrame(this.animate)

        // Animation
        this.renderer.render(this.scene, this.camera)
    }

    startAnimation()
    {
        this.isAnimating = true
        this.animate()
    }

    stopAnimation()
    {
        this.isAnimating = false
        cancelAnimationFrame(this.animationId)
    }

    onWindowResize()
    {
        if (!this.camera || !this.renderer || !this.canvas)
            return
        const windowWidth = window.innerWidth;
        const windowHeight = window.innerHeight;
        // Dimensions pour respecter le ratio
        let width, height;

        if (windowWidth / windowHeight > ASPECT_RATIO)
        {
            // Trop large : on ajuste la largeur en fonction de la hauteur
            height = windowHeight;
            width = height * ASPECT_RATIO;
        }
        else
        {
            // Trop haut : on ajuste la hauteur en fonction de la largeur
            width = windowWidth;
            height = width / ASPECT_RATIO;
        }
        // Appliquer les dimensions au canvas
        this.canvas.style.width = `${width}px`;
        this.canvas.style.height = `${height}px`;
        // Mettre à jour le renderer
        this.renderer.setSize(width, height);
        // Mettre à jour la caméra
        this.camera.aspect = width / height;
        this.camera.updateProjectionMatrix();
    }

    onKeyDown(event)
    {
        if (event.key === 'ArrowUp')
            this.keyPressed.up = true
        if (event.key === 'ArrowDown')
            this.keyPressed.down = true
    }

    onKeyUp(event)
    {
        if (event.key === 'ArrowUp')
            this.keyPressed.up = false
        if (event.key === 'ArrowDown')
            this.keyPressed.down = false
    }

    dispose()
    {
        this.stopAnimation()
        window.removeEventListener('resize', this.resize_handler)
        window.removeEventListener('keydown', this.keydown_handler)
        window.removeEventListener('keyup', this.keyup_handler)
        if (this.Area)
            this.Area.dispose()
        if (this.Ball)
            this.Ball.dispose()
        if (this.controls)
            this.controls.dispose()
        if (this.ambientLight)
            this.ambientLight.dispose()
        if (this.scene)
            this.scene.clear()
        if (this.renderer)
        {
            this.renderer.dispose()
            const canvas = this.renderer.domElement
            if (canvas.parentNode)
                canvas.parentNode.removeChild(canvas)
        }
        this.scene = null
        this.camera = null
        this.renderer = null
        this.Area = null
        this.Ball = null
        this.LeftPaddle = null
        this.RightPaddle = null
        this.controls = null
        this.ambientLight = null
        this.canvas = null
    }
}

export default StateGame