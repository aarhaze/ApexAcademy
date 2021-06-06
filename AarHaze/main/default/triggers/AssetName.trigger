trigger AssetName on Asset (before insert) {

    for (Asset asset : Trigger.new) {
        string assetName = '';
        assetName = asset.Name.left(2).toUpperCase();
        assetName = assetName + '-';
        assetName = assetName + asset.Name.right(4);
        asset.Name = assetName;
    }

}