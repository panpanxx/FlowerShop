package domain;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
//���ﳵ��
public class Cart {
    //������Ʒ�ļ���
    private HashMap<Promsg,Integer> goods;
    
    //���ﳵ���ܽ��
    private double totalPrice;
    //���췽��
    public Cart()
    {
        goods = new HashMap<Promsg,Integer>();
        totalPrice = 0.0;
    }
    
    
    public HashMap<Promsg, Integer> getGoods() {
        return goods;
    }
    public void setGoods(HashMap<Promsg, Integer> goods) {
        this.goods = goods;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    //�����Ʒ�����ﳵ�ķ���
    public boolean addGoodsInCart(Promsg item ,int number)
    {
        if(goods.containsKey(item))
        {
            goods.put(item, goods.get(item)+number);
        }
        else
        {
            goods.put(item, number);    
        }
        calTotalPrice(); //���¼��㹺�ﳵ���ܽ��
        return true;
    }
    
    //ɾ����Ʒ�ķ���
    public boolean removeGoodsFromCart(Promsg item)
    {
        goods.remove(item);
        calTotalPrice(); //���¼��㹺�ﳵ���ܽ��
        return true;
    }
    
    //ͳ�ƹ��ﳵ���ܽ��
    public double calTotalPrice()
    {
        double sum = 0.0;
        Set<Promsg> keys = goods.keySet(); //��ü��ļ���
        Iterator<Promsg> it = keys.iterator(); //��õ���������
        while(it.hasNext())
        {
        	Promsg i = it.next();
            sum += i.getPrice()* goods.get(i);
        }
        this.setTotalPrice(sum); //���ù��ﳵ���ܽ��
        return this.getTotalPrice();
    }
    

}
