@IsTest
public class AssetNameTest {
    @IsTest static void Test() {
        Asset newAsset = new Asset(
            Name = 'mh5678',
            AccountId = '0011y00000I6imlAAB'
        );

        insert newAsset;
    }
}