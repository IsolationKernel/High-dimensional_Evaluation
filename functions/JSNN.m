function [ m_jaccard, m_snn ] = JSNN(data, k, p)
%SNN2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 
n = size(data,1);
J = knnsearch(data,data,'K',k+1,'Distance','minkowski','P',p);
I = repmat((1:n)', 1, size(J, 2));

A = accumarray([I(:) J(:)], 1);
Ap = A.*(1 - eye(n));

m = Ap*Ap';
mknn = A.*A';
m_snn = m.*mknn;

m_jaccard=m./(k*2 - m);

end