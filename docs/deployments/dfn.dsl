dfnscion {
    id = "dfnscion"
    description = "SCION Deployment DFN"
    host {
        id = "dfn0"
        location = "erl"
        imageId = "Ubuntu-16.04.qcow2"
        flavorId = "c4r8h20"
        port { id = "p1" }
        port { id = "p2" }
        port { id = "p3" }
        port { id = "p4" }
        port { id = "p5" }
        port { id = "p6" }
        port { id = "p7" }
        port { id = "p8" }
    }
    host {
        id = "dfn1"
        location = "erl"
        imageId = "Ubuntu-16.04.qcow2"
        flavorId = "c4r8h20"
        port { id = "p1" }
        port { id = "p2" }
        port { id = "p3" }
        port { id = "p4" }
        port { id = "p5" }
        port { id = "p6" }
        port { id = "p7" }
        port { id = "p8" }
    }
    host {
        id = "dfn2"
        location = "erl"
        imageId = "Ubuntu-16.04.qcow2"
        flavorId = "c4r8h20"
        port { id = "p1" }
        port { id = "p2" }
        port { id = "p3" }
        port { id = "p4" }
        port { id = "p5" }
        port { id = "p6" }
        port { id = "p7" }
        port { id = "p8" }
    }
    host {
        id = "dfn3"
        location = "erl"
        imageId = "Ubuntu-16.04.qcow2"
        flavorId = "c4r8h20"
        port { id = "p1" }
        port { id = "p2" }
        port { id = "p3" }
        port { id = "p4" }
        port { id = "p5" }
        port { id = "p6" }
        port { id = "p7" }
        port { id = "p8" }
    }
    link {
        id = "link1"
        port { id = "src"}
        port { id = "dst"}
    }
    link {
        id = "link2"
        port { id = "src"}
        port { id = "dst"}
    }
    link {
        id = "link3"
        port { id = "src"}
        port { id = "dst"}
    }
    link {
        id = "link4"
        port { id = "src"}
        port { id = "dst"}
    }
    link {
        id = "link5"
        port { id = "src"}
        port { id = "dst"}
    }
    link {
        id = "link6"
        port { id = "src"}
        port { id = "dst"}
    }
    adjacency dfn0.p2, link1.src
    adjacency dfn1.p2, link1.dst
    adjacency dfn0.p3, link2.src
    adjacency dfn2.p2, link2.dst
    adjacency dfn0.p4, link3.src
    adjacency dfn3.p2, link3.dst
    adjacency dfn1.p3, link4.src
    adjacency dfn2.p3, link4.dst
    adjacency dfn1.p4, link5.src
    adjacency dfn3.p3, link5.dst
    adjacency dfn2.p4, link6.src
    adjacency dfn3.p4, link6.dst
}

