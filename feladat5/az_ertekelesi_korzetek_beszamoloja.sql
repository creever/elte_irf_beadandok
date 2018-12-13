create or replace PROCEDURE report_2(sales_area_input IN varchar2) IS
    customer_price FLOAT;
    balance FLOAT;
    order_count NUMBER;
    all_order_count NUMBER;
    order_summary FLOAT;
    all_order_summary FLOAT;
BEGIN
    all_order_count := 0;
    all_order_summary := 0;
    
    dbms_output.put_line('Értékesítési körzet sz.:' || chr(9) || sales_area_input);
    dbms_output.put_line('Vevõ Sz.' || chr(9) || 'Eddigi megrendelések' || chr(9) || 'Számla egyenleg' || chr(9) || 'Megrendelés Értéke');
    
    FOR icustomer IN
    (
        SELECT id, discount_group FROM customers WHERE sales_area=sales_area_input
    )
    LOOP
    
        order_summary := 0;
        
        SELECT count(o.id) INTO order_count FROM orders o WHERE o.customer_id=icustomer.id;
        all_order_count := all_order_count + order_count;

        FOR iorder IN (
            select * from orders where customer_id = icustomer.id
        )
        LOOP
            FOR iorder_products IN (
                select * from order_products where order_products.id = iorder.id
            )
            LOOP
                IF icustomer.discount_group like 'A' THEN
                    SELECT price_a INTO customer_price FROM products WHERE id=iorder_products.product_id;
                ELSIF icustomer.discount_group like 'B' THEN
                    SELECT price_b INTO customer_price FROM products WHERE id=iorder_products.product_id;
                ELSIF icustomer.discount_group like 'C' THEN
                    SELECT price_c INTO customer_price FROM products WHERE id=iorder_products.product_id;
                ELSIF icustomer.discount_group like 'D' THEN
                    SELECT price_d INTO customer_price FROM products WHERE id=iorder_products.product_id;
                ELSE
                    SELECT price INTO customer_price FROM products WHERE id=iorder_products.product_id;
                END IF;
                
                order_summary := order_summary + iorder_products.quantity * customer_price;
                all_order_summary := all_order_summary + iorder_products.quantity * customer_price;
                
            END LOOP;
        END LOOP;

        SELECT sum(amount) INTO balance 
        FROM customer_transactions ct 
        WHERE ct.customer_id=icustomer.id;

        dbms_output.put_line(
            icustomer.id || chr(9) || 
            order_count || chr(9) ||  chr(9) || 
            balance || chr(9) ||  chr(9) || 
            order_summary
        );
    END LOOP;
    
    dbms_output.put_line(
        'Összes:' || chr(9) || 
        all_order_count || chr(9) ||
        chr(9) || chr(9) || chr(9) || 
        all_order_summary
    );
END;