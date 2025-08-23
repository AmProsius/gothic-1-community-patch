/*
 * #147 Spelling - Crawler Plate Armor (DE)
 */
func int G1CP_0147_DE_CrawlerPlateArmorName() {
    var int itemId; itemId = G1CP_GetItemInstId("CRW_ARMOR_H");
    return (G1CP_ReplaceAssignStr(itemId, 0, "C_Item.name", "Crawler-Plattenrüstung", "Crawlerplatten-Rüstung") > 0);
};
