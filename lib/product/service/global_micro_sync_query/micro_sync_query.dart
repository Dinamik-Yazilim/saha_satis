class GlobalMicroSyncQuery {
  // Database connection settings, defined as constants.
  static const Map<String, dynamic> _dbConfig = {
    "user": "hakan",
    "password": "1475",
    "database": "MikroDB_V16_100",
    "server": "localhost",
    "port": 1440,
    "dialect": "mssql",
    "dialectOptions": {"instanceName": ""},
    "options": {"encrypt": false, "trustServerCertificate": true},
  };

  /// Placeholders (`{lastUpDate}`, `{offset}`, `{fetchNext}`) are used for parameters.

  // SQL Query Template for Barcode Definitions
  static const String barcodeSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM BARKOD_TANIMLARI WHERE bar_lastup_date > '{lastUpDate}') AS totalCountForSync,
    bar_Guid AS id,
    bar_kodu AS code,
    bar_stokkodu AS stockCode,
    bar_barkodtipi AS barcodeType,
    bar_icerigi AS content,
    bar_birimpntr AS unitPointer,
    bar_bedenpntr AS sizePointer,
    bar_renkpntr AS colorPointer,
    bar_create_user AS createdBy,
    bar_create_date AS createdAt,
    bar_lastup_user AS updatedBy,
    bar_lastup_date AS updatedAt
FROM
    BARKOD_TANIMLARI
WITH (NOLOCK)
WHERE
    bar_lastup_date > '{lastUpDate}'
ORDER BY
    bar_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Banks
  static const String banksSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM BANKALAR WHERE ban_lastup_date > '{lastUpDate}') AS totalCountForSync,
    ban_Guid AS id,
    ban_kod AS code,
    ban_ismi AS name,
    ban_create_user AS createdBy,
    ban_create_date AS createdAt,
    ban_lastup_user AS updatedBy,
    ban_lastup_date AS updatedAt
FROM
    Bankalar
WITH (NOLOCK)
WHERE
    ban_lastup_date > '{lastUpDate}'
ORDER BY
    ban_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Customer Addresses
  static const String customerAddressesSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM CARI_HESAP_ADRESLERI WHERE adr_lastup_date > '{lastUpDate}') AS totalCountForSync,
    adr_Guid AS id,
    adr_cari_kod AS accountCode,
    adr_adres_no AS addressNo,
    adr_cadde AS street,
    adr_mahalle AS neighborhood,
    adr_sokak AS avenue,
    adr_semt AS district,
    adr_Apt_No AS apartmentNo,
    adr_posta_kodu AS zipCode,
    adr_ilce AS county,
    adr_il AS city,
    adr_Adres_kodu AS addressCode,
    adr_tel_ulke_kodu AS phoneCountryCode,
    adr_tel_bolge_kodu AS phoneAreaCode,
    adr_tel_no1 AS phoneNo1,
    adr_tel_no2 AS phoneNo2,
    adr_temsilci_kodu AS representativeCode,
    adr_ozel_not AS specialNote,
    adr_ziyaretgunu AS visitDay,
    adr_gps_enlem AS gpsLatitude,
    adr_gps_boylam AS gpsLongitude,
    adr_ziyarethaftasi AS visitWeek,
    adr_ziygunu2_1 AS visitDay2_1,
    adr_ziygunu2_2 AS visitDay2_2,
    adr_ziygunu2_3 AS visitDay2_3,
    adr_ziygunu2_4 AS visitDay2_4,
    adr_ziygunu2_5 AS visitDay2_5,
    adr_ziygunu2_6 AS visitDay2_6,
    adr_ziygunu2_7 AS visitDay2_7,
    adr_efatura_alias AS eInvoiceAlias,
    adr_create_user AS createdBy,
    adr_create_date AS createdAt,
    adr_lastup_user AS updatedBy,
    adr_lastup_date AS updatedAt
FROM
    CARI_HESAP_ADRESLERI
WITH (NOLOCK)
WHERE
    adr_lastup_date > '{lastUpDate}'
ORDER BY
    adr_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Account Definitions
  static const String customerAccountsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM CARI_HESAPLAR WHERE cari_lastup_date > '{lastUpDate}') AS totalCountForSync,
    cari_Guid AS id,
    cari_kod AS code,
    cari_unvan1 AS title1,
    cari_unvan2 AS title2,
    cari_vdaire_adi AS taxOfficeName,
    cari_vdaire_no AS taxOfficeNo,
    cari_temsilci_kodu AS representativeCode,
    cari_EMail AS email,
    cari_CepTel AS mobilePhone,
    cari_vergidairekodu AS taxOfficeCode,
    cari_nacekodu_1 AS naceCode1,
    cari_nacekodu_2 AS naceCode2,
    cari_sirket_turu AS companyType,
    cari_create_user AS createdBy,
    cari_create_date AS createdAt,
    cari_lastup_user AS updatedBy,
    cari_lastup_date AS updatedAt
FROM
    CARI_HESAPLAR
WITH (NOLOCK)
WHERE
    cari_lastup_date > '{lastUpDate}'
ORDER BY
    cari_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Warehouses
  static const String warehousesSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM DEPOLAR WHERE dep_lastup_date > '{lastUpDate}') AS totalCountForSync,
    dep_Guid AS id,
    dep_no AS no,
    dep_adi AS name,
    dep_tipi AS type,
    dep_create_user AS createdBy,
    dep_create_date AS createdAt,
    dep_lastup_user AS updatedBy,
    dep_lastup_date AS updatedAt
FROM
    DEPOLAR
WITH (NOLOCK)
WHERE
    dep_lastup_date > '{lastUpDate}'
ORDER BY
    dep_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Cash Registers
  static const String cashboxesSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM KASALAR WHERE kas_lastup_date > '{lastUpDate}') AS totalCountForSync,
    kas_Guid AS id,
    kas_kod AS code,
    kas_isim AS name,
    kas_tip AS type,
    kas_create_user AS createdBy,
    kas_create_date AS createdAt,
    kas_lastup_user AS updatedBy,
    kas_lastup_date AS updatedAt
FROM
    KASALAR
WITH (NOLOCK)
WHERE
    kas_lastup_date > '{lastUpDate}'
ORDER BY
    kas_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Payment Plans
  static const String paymentPlansSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM ODEME_PLANLARI WHERE odp_lastup_date > '{lastUpDate}') AS totalCountForSync,
    odp_Guid AS id,
    odp_no AS no,
    odp_kodu AS code,
    odp_adi AS name,
    odp_aratop AS subtotal,
    odp_create_user AS createdBy,
    odp_create_date AS createdAt,
    odp_lastup_user AS updatedBy,
    odp_lastup_date AS updatedAt
FROM
    ODEME_PLANLARI
WITH (NOLOCK)
WHERE
    odp_lastup_date > '{lastUpDate}'
ORDER BY
    odp_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Projects
  static const String projectsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM PROJELER WHERE pro_lastup_date > '{lastUpDate}') AS totalCountForSync,
    pro_Guid AS id,
    pro_kodu AS code,
    pro_adi AS name,
    pro_musterikodu AS customerCode,
    pro_sormerkodu AS ownerCode,
    pro_bolgekodu AS areaCode,
    pro_sektorkodu AS sectorCode,
    pro_grupkodu AS groupCode,
    pro_durumu AS status,
    pro_aciklama AS description,
    pro_ana_projekodu AS mainProjectCode,
    pro_planlanan_sure AS plannedDuration,
    pro_planlanan_bastarih AS plannedStartDate,
    pro_planlanan_bittarih AS plannedEndDate,
    pro_gerceklesen_bastarih AS actualStartDate,
    pro_gerceklesen_bittarih AS actualEndDate,
    pro_baslangic_gecikmesebep AS startDelayReason,
    pro_bitis_gecikmesebep AS endDelayReason,
    pro_create_user AS createdBy,
    pro_create_date AS createdAt,
    pro_lastup_user AS updatedBy,
    pro_lastup_date AS updatedAt
FROM
    PROJELER
WITH (NOLOCK)
WHERE
    pro_lastup_date > '{lastUpDate}'
ORDER BY
    pro_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Stock Sales Price List Definitions
  static const String stockSalePriceListsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM STOK_SATIS_FIYAT_LISTE_TANIMLARI WHERE sfl_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sfl_Guid AS id,
    sfl_sirano AS sequenceNo,
    sfl_aciklama AS description,
    sfl_kdvdahil AS vatIncluded,
    sfl_ilktarih AS startDate,
    sfl_sontarih AS endDate,
    sfl_yerineuygulanacakfiyat AS appliedPrice,
    sfl_create_user AS createdBy,
    sfl_create_date AS createdAt,
    sfl_lastup_user AS updatedBy,
    sfl_lastup_date AS updatedAt
FROM
    STOK_SATIS_FIYAT_LISTE_TANIMLARI
WITH (NOLOCK)
WHERE
    sfl_lastup_date > '{lastUpDate}'
ORDER BY
    sfl_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Stock Sales Price Lists
  static const String stockSalesPricesSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM STOK_SATIS_FIYAT_LISTELERI WHERE sfiyat_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sfiyat_Guid AS id,
    sfiyat_stokkod AS stockCode,
    sfiyat_listesirano AS listSequenceNo,
    sfiyat_deposirano AS warehouseSequenceNo,
    sfiyat_odemeplan AS paymentPlan,
    sfiyat_birim_pntr AS unitPointer,
    sfiyat_fiyati AS price,
    sfiyat_doviz AS currency,
    sfiyat_iskontokod AS discountCode,
    sfiyat_create_user AS createdBy,
    sfiyat_create_date AS createdAt,
    sfiyat_lastup_user AS updatedBy,
    sfiyat_lastup_date AS updatedAt
FROM
    STOK_SATIS_FIYAT_LISTELERI
WITH (NOLOCK)
WHERE
    sfiyat_lastup_date > '{lastUpDate}'
ORDER BY
    sfiyat_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Responsibility Centers
  static const String responsibilityCentersSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM SORUMLULUK_MERKEZLERI WHERE som_lastup_date > '{lastUpDate}') AS totalCountForSync,
    som_Guid AS id,
    som_kod AS code,
    som_isim AS name,
    som_tipi AS type,
    som_create_user AS createdBy,
    som_create_date AS createdAt,
    som_lastup_user AS updatedBy,
    som_lastup_date AS updatedAt
FROM
    SORUMLULUK_MERKEZLERI
WITH (NOLOCK)
WHERE
    som_lastup_date > '{lastUpDate}'
ORDER BY
    som_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Stocks
  static const String stocksSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM STOKLAR WHERE sto_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sto_Guid AS id,
    sto_kod AS code,
    sto_isim AS name,
    sto_kisa_ismi AS shortName,
    sto_yabanci_isim AS foreignName,
    sto_sat_cari_kod AS vendorCode,
    sto_birim1_ad AS unit1Name,
    sto_birim1_katsayi AS unit1Multiplier,
    sto_birim2_ad AS unit2Name,
    sto_birim2_katsayi AS unit2Multiplier,
    sto_birim3_ad AS unit3Name,
    sto_birim3_katsayi AS unit3Multiplier,
    sto_birim4_ad AS unit4Name,
    sto_birim4_katsayi AS unit4Multiplier,
    sto_perakende_vergi AS retailTax,
    sto_toptan_vergi AS wholesaleTax,
    sto_satis_dursun AS salesBlocked,
    sto_siparis_dursun AS orderBlocked,
    sto_malkabul_dursun AS goodsReceiptBlocked,
    sto_kategori_kodu AS categoryCode,
    sto_marka_kodu AS brandCode,
    sto_beden_kodu AS sizeCode,
    sto_renk_kodu AS colorCode,
    sto_model_kodu AS modelCode,
    sto_sezon_kodu AS seasonCode,
    sto_mensei AS origin,
    sto_anagrup_kod AS mainGroupCode,
    sto_detay_takip AS detailTracking,
    sto_create_user AS createdBy,
    sto_create_date AS createdAt,
    sto_lastup_user AS updatedBy,
    sto_lastup_date AS updatedAt
FROM
    STOKLAR
WITH (NOLOCK)
WHERE
    sto_lastup_date > '{lastUpDate}'
ORDER BY
    sto_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Current Account Movements
  static const String customerAccountMovementsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM CARI_HESAP_HAREKETLERI WHERE cha_lastup_date > '{lastUpDate}') AS totalCountForSync,
    cha_Guid AS id,
    cha_firmano AS companyNo,
    cha_subeno AS branchNo,
    cha_evrak_tip AS documentType,
    cha_evrakno_seri AS documentSerialNo,
    cha_evrakno_sira AS documentSequenceNo,
    cha_satir_no AS documentLineNo,
    cha_tip AS type,
    cha_cinsi AS kind,
    cha_belge_no AS documentNo,
    cha_belge_tarih AS documentDate,
    cha_aciklama AS description,
    cha_satici_kodu AS vendorCode,
    cha_cari_cins AS accountKind,
    cha_kod AS code,
    cha_ciro_cari_kodu AS turnoverAccountCode,
    cha_altd_kur AS exchangeRate,
    cha_srmrkkodu AS responsibilityCenterCode,
    cha_kasa_hizkod AS cashServiceCode,
    cha_miktari AS quantity,
    cha_meblag AS amount,
    cha_aratoplam AS subtotal,
    cha_vade AS dueDate,
    cha_ft_iskonto1 AS invoiceDiscount1,
    cha_ft_iskonto2 AS invoiceDiscount2,
    cha_ft_iskonto3 AS invoiceDiscount3,
    cha_ft_iskonto4 AS invoiceDiscount4,
    cha_ft_iskonto5 AS invoiceDiscount5,
    cha_ft_iskonto6 AS invoiceDiscount6,
    cha_ft_masraf1 AS invoiceExpense1,
    cha_ft_masraf2 AS invoiceExpense2,
    cha_ft_masraf3 AS invoiceExpense3,
    cha_ft_masraf4 AS invoiceExpense4,
    cha_vergi1 AS tax1,
    cha_vergi2 AS tax2,
    cha_vergi3 AS tax3,
    cha_vergi4 AS tax4,
    cha_vergi5 AS tax5,
    cha_vergi6 AS tax6,
    cha_vergi7 AS tax7,
    cha_vergi8 AS tax8,
    cha_vergi9 AS tax9,
    cha_vergi10 AS tax10,
    cha_vergi11 AS tax11,
    cha_vergi12 AS tax12,
    cha_vergi13 AS tax13,
    cha_vergi14 AS tax14,
    cha_vergi15 AS tax15,
    cha_vergi16 AS tax16,
    cha_vergi17 AS tax17,
    cha_vergi18 AS tax18,
    cha_vergi19 AS tax19,
    cha_vergi20 AS tax20,
    cha_create_user AS createdBy,
    cha_create_date AS createdAt,
    cha_lastup_user AS updatedBy,
    cha_lastup_date AS updatedAt
FROM
    CARI_HESAP_HAREKETLERI
WITH (NOLOCK)
WHERE
    cha_lastup_date > '{lastUpDate}'
ORDER BY
    cha_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Stock Movements
  static const String stockMovementsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM STOK_HAREKETLERI WHERE sth_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sth_Guid AS id,
    sth_tip AS type,
    sth_cins AS kind,
    sth_evraktip AS documentType,
    sth_evrakno_seri AS documentSerialNo,
    sth_evrakno_sira AS documentSequenceNo,
    sth_satirno AS documentLineNo,
    sth_belge_no AS documentNo,
    sth_belge_tarih AS documentDate,
    sth_stok_kod AS stockCode,
    sth_cari_kodu AS accountCode,
    sth_plasiyer_kodu AS salespersonCode,
    sth_alt_doviz_kuru AS exchangeRate,
    sth_miktar AS quantity,
    sth_miktar2 AS quantity2,
    sth_birim_pntr AS unitPointer,
    sth_tutar AS amount,
    sth_iskonto1 AS discount1,
    sth_iskonto2 AS discount2,
    sth_iskonto3 AS discount3,
    sth_iskonto4 AS discount4,
    sth_iskonto5 AS discount5,
    sth_iskonto6 AS discount6,
    sth_masraf1 AS expense1,
    sth_masraf2 AS expense2,
    sth_masraf3 AS expense3,
    sth_masraf4 AS expense4,
    sth_vergi_pntr AS taxPointer,
    sth_vergi AS taxAmount,
    sth_aciklama AS description,
    sth_sip_uid AS orderUid,
    sth_fat_uid AS invoiceUid,
    sth_giris_depo_no AS entryWarehouseNo,
    sth_cikis_depo_no AS exitWarehouseNo,
    sth_malkbl_sevk_tarihi AS goodsReceiptShipmentDate,
    sth_cari_srm_merkezi AS accountResponsibilityCenter,
    sth_maliyet_ana AS costMain,
    sth_maliyet_alternatif AS costAlternative,
    sth_maliyet_orjinal AS costOriginal,
    sth_create_user AS createdBy,
    sth_create_date AS createdAt,
    sth_lastup_user AS updatedBy,
    sth_lastup_date AS updatedAt
FROM
    STOK_HAREKETLERI
WITH (NOLOCK)
WHERE
    sth_lastup_date > '{lastUpDate}'
ORDER BY
    sth_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Orders
  static const String ordersSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM SIPARISLER WHERE sip_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sip_Guid AS id,
    sip_cins AS kind,
    sip_tip AS type,
    sip_evrakno_seri AS documentSerialNo,
    sip_evrakno_sira AS documentSequenceNo,
    sip_satirno AS documentLineNo,
    sip_satici_kod AS vendorCode,
    sip_b_fiyat AS unitPrice,
    sip_miktar AS quantity,
    sip_birim_pntr AS unitPointer,
    sip_teslim_miktar AS deliveredQuantity,
    sip_tutar AS amount,
    sip_iskonto1 AS discount1,
    sip_iskonto2 AS discount2,
    sip_iskonto3 AS discount3,
    sip_iskonto4 AS discount4,
    sip_iskonto5 AS discount5,
    sip_iskonto6 AS discount6,
    sip_masraf1 AS expense1,
    sip_masraf2 AS expense2,
    sip_masraf3 AS expense3,
    sip_masraf4 AS expense4,
    sip_vergi_pntr AS taxPointer,
    sip_vergi AS taxAmount,
    sip_aciklama AS description,
    sip_aciklama2 AS description2,
    sip_depono AS warehouseNo,
    sip_doviz_kuru AS currencyRate,
    sip_alt_doviz_kuru AS exchangeRate,
    sip_create_user AS createdBy,
    sip_create_date AS createdAt,
    sip_lastup_user AS updatedBy,
    sip_lastup_date AS updatedAt
FROM
    SIPARISLER
WITH (NOLOCK)
WHERE
    sip_lastup_date > '{lastUpDate}'
ORDER BY
    sip_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Payment Orders
  static const String paymentOrdersSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM ODEME_EMIRLERI WHERE sck_lastup_date > '{lastUpDate}') AS totalCountForSync,
    sck_Guid AS id,
    sck_firmano AS companyNo,
    sck_subeno AS branchNo,
    sck_tip AS type,
    sck_refno AS referenceNo,
    sck_bankano AS bankNo,
    sck_borclu AS debtor,
    sck_vade AS dueDate,
    sck_tutar AS amount,
    sck_doviz AS currency,
    sck_odenen AS paidAmount,
    sck_sahip_cari_cins AS ownerAccountKind,
    sck_sahip_cari_kodu AS ownerAccountCode,
    sck_sahip_cari_grupno AS ownerAccountGroupNo,
    sck_nerede_cari_cins AS locationAccountKind,
    sck_nerede_cari_kodu AS locationAccountCode,
    sck_nerede_cari_grupno AS locationAccountGroupNo,
    sck_ilk_evrak_seri AS firstDocumentSerial,
    sck_ilk_evrak_sira_no AS firstDocumentSequenceNo,
    sck_ilk_evrak_satir_no AS firstDocumentLineNo,
    sck_sonpoz AS lastPosition,
    sck_create_user AS createdBy,
    sck_create_date AS createdAt,
    sck_lastup_user AS updatedBy,
    sck_lastup_date AS updatedAt
FROM
    ODEME_EMIRLERI
WITH (NOLOCK)
WHERE
    sck_lastup_date > '{lastUpDate}'
ORDER BY
    sck_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  // SQL Query Template for Current Account Personnel Definitions
  static const String personnelDefinitionsSyncQueryTemplate = """
SELECT
    (SELECT COUNT(*) FROM CARI_PERSONEL_TANIMLARI WHERE cari_per_lastup_date > '{lastUpDate}') AS totalCountForSync,
    cari_per_Guid AS id,
    cari_per_kod AS personnelCode,
    cari_per_adi AS firstName,
    cari_per_soyadi AS lastName,
    cari_per_tip AS type,
    cari_per_doviz_cinsi AS currencyType,
    cari_per_userno AS userNo,
    cari_per_depono AS warehouseNo,
    cari_per_cepno AS mobilePhone,
    cari_per_mail AS email,
    cari_takvim_kodu AS calendarCode,
    cari_per_TcKimlikNo AS identityNo,
    cari_per_create_user AS createdBy,
    cari_per_create_date AS createdAt,
    cari_per_lastup_user AS updatedBy,
    cari_per_lastup_date AS updatedAt
FROM
    CARI_PERSONEL_TANIMLARI
WITH (NOLOCK)
WHERE
    cari_per_lastup_date > '{lastUpDate}'
ORDER BY
    cari_per_lastup_date
OFFSET {offset} ROWS
FETCH NEXT {fetchNext} ROWS ONLY;
""";

  /// Generates a JSON payload containing the database configuration and the dynamic SQL query.
  ///
  /// The [queryTemplate] parameter takes the SQL query template to be used (e.g., `barcodeSyncQueryTemplate`).
  /// Placeholders within this template are replaced with the provided [lastUpDate], [offset], and [fetchNext] values.
  static Map<String, dynamic> createQueryPayload({
    required String queryTemplate, // Takes the query template
    required String lastUpDate,
    required int offset,
    required int fetchNext,
  }) {
    // Replace placeholders in the query template with actual values.
    final String filledSqlQuery = queryTemplate
        .replaceAll('{lastUpDate}', lastUpDate)
        .replaceAll('{offset}', offset.toString())
        .replaceAll('{fetchNext}', fetchNext.toString());

    return {
      "config": _dbConfig, // Uses the constant DB configuration.
      "query": filledSqlQuery, // Sends the populated SQL query.
    };
  }
}
