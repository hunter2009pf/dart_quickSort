import 'dart:math';

List<int> generateIntegers(){
  List<int> li=List<int>();
  for(int i=0;i<1000;i++){
    int x=Random().nextInt(10000);
    li.add(x);
  }
  return li;
}

void quickSort(List<int> lst, int left, int right){
  if(left>=right)return;
  int pivot=left, i=left, j=right, direction=-1, temp=0;
  while(i<j){
    if(direction==-1){
      if(lst[j]<lst[pivot]){
        temp=lst[j];
        lst[j]=lst[pivot];
        lst[pivot]=temp;
        pivot=j;
        direction=1;
      }else j--;
    }
    if(direction==1){
      if(lst[i]>lst[pivot]){
        temp=lst[i];
        lst[i]=lst[pivot];
        lst[pivot]=temp;
        pivot=i;
        direction=-1;
      }else i++;
    }
  }
  quickSort(lst, left, i);
  quickSort(lst, i+1, right);
}

void main(){
     List<int> intSet=generateIntegers();
     DateTime dt1=DateTime.now();
     print('the original list is $intSet');
     quickSort(intSet, 0, 999);
     print('the sorted list is $intSet');
     DateTime dt2=DateTime.now();
     int interval=dt2.millisecondsSinceEpoch-dt1.millisecondsSinceEpoch;
     print('time cost is $interval');
}