Bridge = {}
Bridge.frameWork =
    (GetResourceState("es_extended"):find("start") and "esx")
    or
    (GetResourceState("qb-core"):find("start") and "qb")

Bridge.core =
    (Bridge.frameWork == "esx" and exports["es_extended"]:getSharedObject())
    or
    (Bridge.frameWork == "qb" and exports["qb-core"]:GetCoreObject())