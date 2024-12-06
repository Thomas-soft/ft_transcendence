import * as THREE from 'three'

class Ball
{
    constructor()
    {
        // Géométrie de la balle
        this.geometry = new THREE.SphereGeometry(0.2, 32, 32)

        // Matériau émissif pour un effet lumineux
        this.material = new THREE.MeshStandardMaterial({
            color: "red",         // Couleur principale
            emissive: "red",       // Couleur de l'émission lumineuse
            emissiveIntensity: 1.5  // Intensité de la lumière
        })

        // Mesh de la balle
        this.mesh = new THREE.Mesh(this.geometry, this.material)
        this.mesh.position.set(0, 0, 0)
    }

    dispose()
    {
        if (this.geometry)
            this.geometry.dispose()
        if (this.material)
            this.material.dispose()
        if (this.mesh)
            this.mesh.clear()
    }
}

export default Ball