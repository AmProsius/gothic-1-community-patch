/*
 * #147 Spelling - Crawler Plate Armor (DE)
 */
func int G1CP_147_DE_CrawlerPlateArmorName() {
    var int symbId; symbId = MEM_GetSymbolIndex("CRW_ARMOR_H");
    return (G1CP_ReplaceAssignStr(symbId, 0, "C_ITEM.NAME", 0, "Crawler-Plattenr�stung", "Crawlerplatten-R�stung") > 0);
};
