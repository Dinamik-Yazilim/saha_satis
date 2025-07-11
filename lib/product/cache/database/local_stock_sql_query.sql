WITH Stock AS (
SELECT DISTINCT
            S.id AS ID, -- stocks.id
            S.code AS StockCode, -- stocks.code
            S.name AS StockName, -- stocks.name
            S.shortName AS ShortName, -- stocks.shortName
            S.foreignName AS ForeignName, -- stocks.foreignName
            CASE
            	WHEN BT.unitPointer = 2 THEN S.unit2Name
            	WHEN BT.unitPointer = 3 THEN S.unit3Name
            	WHEN BT.unitPointer = 4 THEN S.unit4Name
            	ELSE S.unit1Name
            END AS UnitName,
            CASE
            	WHEN BT.unitPointer = 2 THEN S.unit2Multiplier
            	WHEN BT.unitPointer = 3 THEN S.unit3Multiplier
            	WHEN BT.unitPointer = 4 THEN S.unit4Multiplier
            	ELSE S.unit1Multiplier
            END AS UnitMultiplier,
            S.retailTax AS RetailTaxFKID, -- stocks.retailTax
            S.wholesaleTax AS WholesaleTaxFKID, -- stocks.wholesaleTax
            S.salesBlocked AS SalesBlocked, -- stocks.salesBlocked
            S.isPassive AS IsPassive, -- stocks.passive
            S.orderBlocked AS OrderBlocked, -- stocks.orderBlocked
            S.goodsReceiptBlocked AS GoodsReceiptBlocked, -- stocks.goodsReceiptBlocked
            S.createdAt AS StockCreatedAt, -- stocks.createdAt
            S.updatedAt AS StockUpdatedAt, -- stocks.updatedAt
            S.vendorCode AS VendorCode, -- stocks.vendorCode
            S.categoryCode AS CategoryCode, -- stocks.categoryCode
            S.brandCode AS BrandCode, -- stocks.brandCode
            S.sizeCode AS SizeCode, -- stocks.sizeCode
            S.colorCode AS ColorCode, -- stocks.colorCode
            S.modelCode AS ModelCode, -- stocks.modelCode
            S.seasonCode AS SeasonCode, -- stocks.seasonCode
            S.origin AS Origin, -- stocks.origin
            S.mainGroupCode AS MainGroupCode, -- stocks.mainGroupCode
            S.detailTracking AS DetailTracking, -- stocks.detailTracking

            -- Barcode bilgileri
            BT.id AS BarcodeID, -- barcodes.id
            BT.code AS Barcode, -- barcodes.code
            BT.content AS BarcodeContent, -- barcodes.content
            BT.barcodeType AS BarcodeType, -- barcodes.barcodeType
            BT.unitPointer AS BarcodeUnitPointer, -- barcodes.unitPointer
            BT.sizePointer AS SizePointer, -- barcodes.sizePointer
            BT.colorPointer AS ColorPointer, -- barcodes.colorPointer
            BT.createdAt AS BarcodeCreatedAt, -- barcodes.createdAt
            BT.updatedAt AS BarcodeUpdatedAt, -- barcodes.updatedAt

            -- Fiyat ve Vergi bilgileri
            SF1.listSequenceNo as ListSequenceNo1,
            SF2.listSequenceNo as ListSequenceNo2,
            SF1.warehouseSequenceNo AS PriceWarehouseNo1,
            SF2.warehouseSequenceNo AS PriceWarehouseNo2,
            VE1.vatRate AS RetailTaxPercentage, -- taxes.vatRate (perakende)
            VE2.vatRate AS WholesaleTaxPercentage, -- taxes.vatRate (toptan)
            ROUND((CASE WHEN SFL1.vatIncluded = 1 THEN SF1.price ELSE SF1.price * (1 + (VE1.vatRate / 100.0)) END),2) AS RetailPriceIncludingTax1,
            ROUND((CASE WHEN SFL2.vatIncluded = 1 THEN SF2.price ELSE SF2.price * (1 + (VE1.vatRate / 100.0)) END),2) AS RetailPriceIncludingTax2,
            ROUND((CASE WHEN SFL1.vatIncluded = 0 THEN SF1.price ELSE SF1.price / (1 + (VE1.vatRate / 100.0)) END),2) AS RetailPriceExcludingTax1,
            ROUND((CASE WHEN SFL2.vatIncluded = 0 THEN SF2.price ELSE SF2.price / (1 + (VE1.vatRate / 100.0)) END),2) AS RetailPriceExcludingTax2,
            ROUND((CASE WHEN SFL1.vatIncluded = 1 THEN SF1.price ELSE SF1.price * (1 + (VE2.vatRate / 100.0)) END),2) AS WholesalePriceIncludingTax1,
            ROUND((CASE WHEN SFL2.vatIncluded = 1 THEN SF2.price ELSE SF2.price * (1 + (VE2.vatRate / 100.0)) END),2) AS WholesalePriceIncludingTax2,
            ROUND((CASE WHEN SFL1.vatIncluded = 0 THEN SF1.price ELSE SF1.price / (1 + (VE2.vatRate / 100.0)) END),2) AS WholesalePriceExcludingTax1,
            ROUND((CASE WHEN SFL2.vatIncluded = 0 THEN SF2.price ELSE SF2.price / (1 + (VE2.vatRate / 100.0)) END),2) AS WholesalePriceExcludingTax2,

            -- Ek fiyat detayları (SF1'den çekilecektir, aktif fiyata karşılık geldiği varsayılıyor)
            SF1.id AS PriceID, -- stock_sales_prices.id
            SF1.paymentPlan AS PaymentPlan, -- stock_sales_prices.paymentPlan
            SF1.currency AS PriceCurrency, -- stock_sales_prices.currency
            SF1.discountCode AS PriceDiscountCode, -- stock_sales_prices.discountCode
            SF1.createdAt AS PriceCreatedAt, -- stock_sales_prices.createdAt
            SF1.updatedAt AS PriceUpdatedAt, -- stock_sales_prices.updatedAt
            SFL1.vatIncluded AS ListVatIncluded -- stock_sale_price_lists.vatIncluded

        FROM stocks S
        LEFT JOIN barcodes BT ON BT.stockCode = S.code
                LEFT JOIN stock_sales_prices SF1 ON
    SF1.stockCode = S.code
    AND SF1.price > 0
    AND SF1.warehouseSequenceNo = 1
    
    AND SF1.updatedAt = (
        SELECT MAX(sub.updatedAt)
        FROM stock_sales_prices sub
        WHERE sub.stockCode = S.code
          AND sub.price > 0
          AND sub.warehouseSequenceNo = SF1.warehouseSequenceNo
          AND sub.listSequenceNo = SF1.listSequenceNo
          AND sub.unitPointer = BT.unitPointer
    )
                LEFT JOIN stock_sales_prices SF2 ON
    SF2.stockCode = S.code
    AND SF2.price > 0
    AND SF2.warehouseSequenceNo = 0
    
    AND SF2.updatedAt = (
        SELECT MAX(sub.updatedAt)
        FROM stock_sales_prices sub
        WHERE sub.stockCode = S.code
          AND sub.price > 0
          AND sub.warehouseSequenceNo = SF2.warehouseSequenceNo
          AND sub.listSequenceNo = SF2.listSequenceNo
          AND sub.unitPointer = BT.unitPointer
    )
        LEFT JOIN stock_sale_price_lists SFL1 ON SFL1.sequenceNo = SF1.listSequenceNo
        LEFT JOIN stock_sale_price_lists SFL2 ON SFL2.sequenceNo = SF2.listSequenceNo
        LEFT JOIN taxes VE1 ON VE1.vatNo = S.retailTax
        LEFT JOIN taxes VE2 ON VE2.vatNo = S.wholesaleTax
        WHERE
            S.salesBlocked = 0
            AND S.isPassive = 0
            AND S.code LIKE "12511112"
        LIMIT 300 OFFSET 0
)
SELECT DISTINCT
       ID,
       StockCode,
       StockName,
       ShortName,
       ForeignName,
       UnitName,
       UnitMultiplier,
       RetailTaxFKID,
       WholesaleTaxFKID,
       SalesBlocked,
       IsPassive,
       OrderBlocked,
       GoodsReceiptBlocked,
       StockCreatedAt,
       StockUpdatedAt,
       VendorCode,
       CategoryCode,
       BrandCode,
       SizeCode,
       ColorCode,
       ModelCode,
       SeasonCode,
       Origin,
       MainGroupCode,
       DetailTracking,
       BarcodeID,
       Barcode,
       BarcodeContent,
       BarcodeType,
       BarcodeUnitPointer,
       SizePointer,
       ColorPointer,
       BarcodeCreatedAt,
       BarcodeUpdatedAt,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN ListSequenceNo1 ELSE ListSequenceNo2 END AS CurrentListSequenceNo,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN PriceWarehouseNo1 ELSE PriceWarehouseNo2 END AS CurrentPriceWarehouseNo,
       RetailTaxPercentage,
       WholesaleTaxPercentage,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN RetailPriceIncludingTax1 ELSE RetailPriceIncludingTax2 END AS RetailPriceIncludingTax,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN RetailPriceExcludingTax1 ELSE RetailPriceExcludingTax2 END AS RetailPriceExcludingTax,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN WholesalePriceIncludingTax1 ELSE WholesalePriceIncludingTax2 END AS WholesalePriceIncludingTax,
       CASE WHEN ListSequenceNo1=ListSequenceNo2 THEN WholesalePriceExcludingTax1 ELSE WholesalePriceExcludingTax2 END AS WholesalePriceExcludingTax,
       PriceID,
       PaymentPlan,
       PriceCurrency,
       PriceDiscountCode,
       PriceCreatedAt,
       PriceUpdatedAt,
       ListVatIncluded
FROM Stock
ORDER BY StockName ASC;
