create or replace PROCEDURE report_4(wholesale_order_identifier IN varchar2) IS
    wso_oi VARCHAR2(64);
    wso_id NUMBER;
    wso_arrived_at DATE;
    wso_created_at DATE;
    wholesaler_title VARCHAR2(255);
    wholesaler_address VARCHAR2(128);
    wop_quantity_sum_per_order NUMBER;
    new_product_row BOOLEAN;
    new_product_sku VARCHAR2(128);
BEGIN
    SELECT ws.title, ws.address INTO wholesaler_title, wholesaler_address 
    FROM wholesalers ws 
    WHERE ws.id = (
        SELECT wso.wholesaler_id 
        FROM wholesale_orders wso 
        WHERE wso.order_identifier = wholesale_order_identifier
    );
    
    SELECT wso.created_at, wso.arrived_at, wso.order_identifier, wso.id INTO wso_created_at, wso_arrived_at, wso_oi, wso_id 
    FROM wholesale_orders wso 
    WHERE wso.order_identifier = wholesale_order_identifier;

    dbms_output.put_line(
        'Szállítójegy sz.:' || chr(9) ||
        wso_oi || chr(9) ||
        'Dátum:' || chr(9) ||
        to_char(wso_arrived_at, 'yyyy-mm-dd')
    );
    
    dbms_output.put_line(
        'Nagyker.:' || chr(9) ||
        wholesaler_title
    );
    
    dbms_output.put_line(
        chr(9) ||
        wholesaler_address
    );
    
    dbms_output.put_line(
        chr(9) || chr(9) ||'Vásárlói'
    );
    dbms_output.put_line(
        'Cikk Szám' || chr(9) || chr(9) ||
        'Rendelés Szám' || chr(9) || chr(9) ||
        'Vevõ Szám' || chr(9) || chr(9) ||
        'Menny.'
    );

    -- Wholesaler order products
    FOR wsop IN
    (
        SELECT p.sku, wop.quantity, wop.order_product_id
        FROM wholesale_order_products wop 
        JOIN products p ON p.id=wop.product_id 
        WHERE wop.wholesaler_order_id = wso_id
    )
    LOOP
        
        new_product_row := TRUE;
        wop_quantity_sum_per_order := 0;

        FOR opf IN
        (
            SELECT o.order_identifier, p.sku, op.quantity, c.id as cid
            FROM order_products op
            JOIN products p ON p.id = op.product_id
            JOIN orders o ON o.id = op.order_id
            JOIN customers c ON c.id = o.customer_id
            WHERE op.id = wsop.order_product_id
        )
        LOOP

            wop_quantity_sum_per_order := wop_quantity_sum_per_order + opf.quantity;
            
            IF new_product_row = TRUE THEN
                new_product_sku := wsop.sku;
            ELSE
                new_product_sku := '';
            END IF;
            
            dbms_output.put_line(
                new_product_sku || chr(9) || chr(9) ||
                opf.order_identifier || chr(9) || chr(9) || chr(9) || 
                opf.cid || chr(9) || chr(9) || 
                opf.quantity
            );
            
            new_product_row := FALSE;
        END LOOP;

        dbms_output.put_line(
            chr(9) || chr(9) || chr(9) || chr(9) || chr(9) || chr(9) || chr(9) || 
            wop_quantity_sum_per_order || ' Termék összes'
        );
    END LOOP;

END;
