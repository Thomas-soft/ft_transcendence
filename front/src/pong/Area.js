import * as THREE from 'three'

class Area
{
    constructor()
    {
        // Géométrie principale (Box)
        this.geometry = new THREE.BoxGeometry(11, 6, 1)

        // Matériau transparent pour le cube
        this.material = new THREE.MeshStandardMaterial({
            color: "white",
            transparent: true,
            opacity: 0.2
        })

        // Mesh principal
        this.mesh = new THREE.Mesh(this.geometry, this.material)

        // Bordures du cube
        this.edgesGeometry = new THREE.EdgesGeometry(this.geometry)
        this.edgesMaterial = new THREE.LineBasicMaterial({ color: "red" })
        this.edges = new THREE.LineSegments(this.edgesGeometry, this.edgesMaterial)

        // Ajoute les bordures en tant qu'enfant du mesh
        this.mesh.add(this.edges)
    }

    dispose()
    {
        // Nettoyage des ressources
        if (this.geometry)
            this.geometry.dispose()

        if (this.material)
            this.material.dispose()

        if (this.edgesGeometry)
            this.edgesGeometry.dispose()

        if (this.edgesMaterial)
            this.edgesMaterial.dispose()

        // Supprime les relations parent-enfant
        if (this.mesh)
            this.mesh.remove(this.edges)
    }
}

export default Area