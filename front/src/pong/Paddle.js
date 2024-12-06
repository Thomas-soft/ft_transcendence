import * as THREE from 'three'

class Paddle
{
    constructor(x, y)
    {
        this.geometry = new THREE.BoxGeometry(0.2, 2, 0.6)
        this.material = new THREE.MeshStandardMaterial({ color: "red" })
        this.mesh = new THREE.Mesh(this.geometry, this.material)
        this.mesh.position.set(x, y, 0)
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

export default Paddle